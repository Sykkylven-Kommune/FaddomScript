## Default script template
[CmdletBinding()]
param(
    [Parameter(
        ValueFromPipeline = $True,
        ValueFromPipelineByPropertyName = $True
    )]
    [string]$ComputerName
)
Function Install-Faddom {
    BEGIN {
        $currentDir = Split-Path $SCRIPT:MyInvocation.MyCommand.Path -Parent
        $collectorIp = "172.29.105.134"
        Function Logger {
            param(
                [string]$Message,
                [ValidateSet('Info', 'Debug', 'Warning', 'Error')]
                [string]$Severity = "Info"
            )
            $TimeStamp = (Get-Date).ToString("T")
            $Index = "[$TimeStamp] [$Severity] "

            switch ($Severity) {
                "Info" { $color = "white" }
                "Debug" { $color = "gray" }
                "Warning" { $color = "yellow" }
                "Error" { $color = "red" }
            }
  
            Write-Host $Index -ForegroundColor $color -NoNewLine
            Write-Host $Message
        }

        # Variables #
        Logger -Message "Script directory: $currentDir" -Severity Debug
        Logger -Message "Collector IP: $collectorIp" -Severity Debug
        # $installers = @(
        #     @{
        #         "Name"       = "sFlow Generator"
        #         "FileName"   = "FaddomSflowGenerator.msi"
        #         "Parameters" = "COLLECTORADDR=$CollectorIP SAMPLINGRATE=32"
        #     }
        #     @{
        #         "Name"       = "Host sFlow" 
        #         "FileName"   = "hsflowd-win-1.23.5-x64.msi"
        #         "Parameters" = "COLLECTOR_VALUE=$CollectorIP POLLING_VALUE=20"
        #     }   
        # )
        $installers = @{
            "sFlow Generator" = [PSCustomObject]@{
                FileName   = "FaddomSflowGenerator.msi"
                Parameters = "COLLECTORADDR=$CollectorIP SAMPLINGRATE=32"
                RemotePath = ""
            }
            "Host sFlow"      = [PSCustomObject]@{
                FileName   = "hsflowd-win-1.23.5-x64.msi"
                Parameters = "COLLECTOR_VALUE=$CollectorIP POLLING_VALUE=20"
                RemotePath = ""
            }
        }

      
    }

    PROCESS {
        Logger -Message "Executing script on remote computer $ComputerName" -Severity Debug
        try {
            Logger -Message "Creating PSSession."
            $pssession = New-PSSession -ComputerName $ComputerName
        }
        catch {
            <#Do this if a terminating exception happens#>
            Logger -Message $_ -Severity Error
        }

    
        try {
            Foreach ($key in $installers.Keys) {
                $object = $installers[$key]
                Logger -Message "Copying $($key) installer to $($ComputerName)"
                Copy-Item -Path "$($currentDir)\$($object.FileName)" -ToSession $pssession -Destination "C:\Windows\temp\$($object.FileName)" -Recurse -ErrorAction Stop
                Logger -Message "Destination: C:\Windows\temp$($object.FileName)" -Severity Debug
                Logger -Message "Finished copying file $($object.FileName)" -Severity Debug
                $remotePath = "C:\Windows\temp\$($object.FileName)"
                $object.RemotePath = $remotePath
            }       
        }
        catch {
            Logger -Message $_ -Severity Error
            
        }

        Logger -Message "Attempting to run installers remotely"
        
        
        foreach ($key in $installers.Keys) {
            $object = $installers[$key]

            Logger -Message "Name: $($key) - FileName: $($object.FileName) - Parameters: $($object.Parameters) - RemotePath: $($object.RemotePath)" -Severity Debug
            $remotePath = $object.RemotePath
            $name = $key
            $filename = $object.FileName
            $parameters = $object.Parameters
            Invoke-Command -Session $pssession -ScriptBlock {
                #$InstallResults = Start-Process msiexec.exe -ArgumentList "/i $($)"
                $PathExists = Test-Path $using:remotePath
            
                if (Test-Path $using:remotePath) {
                    # Write-Host $using:remotePath
                    # Write-host $using:filename 
                    # write-host $using:parameters
                    # write-host "C:\Windows\Temp\$($using:name).txt"
                    # Write-Host "Path for $($using:filename) exists: $($PathExists)" -ForegroundColor Yellow
                    $InstallResult = Start-Process "msiexec.exe" -ArgumentList "/i", "$($using:remotePath)", "/L*v", "C:\Windows\Temp\$($using:filename).txt", "/quiet", "/norestart", "ACCEPT=yes", "$($using:parameters)" -Wait -PassThru
                    if ($InstallResult.ExitCode -eq 0 ) {
                        Write-Host "Installation for $($using:filename) complete. Removing MSI installers." -ForegroundColor Green
                        Remove-Item -Path $using:remotePath
                    }
                    else {
                        Write-Error "Installation failed with exit code: $($InstallResult.ExitCode)"
                    }
                }
                else {
                    Write-Error "MSI file not found."
                }
                    
                

            }
            
        }

            
        
        
        
  

        
    }

    END {
        Logger -Message "Removing current PSSession: $pssession.id" -Severity Debug
        Remove-PSSession -Id $pssession.Id
        Logger -Message "Script completed with no errors."

    }
}

Install-Faddom