<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">

<img src="readmeai/assets/logos/purple.svg" width="30%" style="position: relative; top: 0; right: 0;" alt="Project Logo"/>

# FADDOMINSTALL

<!-- BADGES -->
<!-- local repository, no metadata badges. -->

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/MSI-FF0000.svg?style=default&logo=MSI&logoColor=white" alt="MSI">

</div>
<br>

---

## ☀️ Table of Contents

- [☀ ️ Table of Contents](#-table-of-contents)
- [🌞 Overview](#-overview)
- [🔥 Features](#-features)
- [🌅 Project Structure](#-project-structure)
    - [🌄 Project Index](#-project-index)
- [🚀 Getting Started](#-getting-started)
    - [🌟 Prerequisites](#-prerequisites)
    - [⚡ Installation](#-installation)
    - [🔆 Usage](#-usage)
    - [🌠 Testing](#-testing)
- [🌻 Roadmap](#-roadmap)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)
- [✨ Acknowledgments](#-acknowledgments)

---

## 🌞 Overview

FaddomInstall is a developer tool designed to streamline the installation process, ensuring seamless system performance and optimized architecture.
 
**Why FaddomInstall?**

This project aims to automate software deployment processes, providing developers with an intuitive and reliable platform for unified data processing and automation. The core features include:

- **🔗** Streamlined Installation: Automates configuration and setup for a seamless experience
- **💻** Unified Data Pipeline: Establishes efficient integration of diverse data sources
- **📦** Reliable Deployment: Ensures smooth installation of sFlow software on remote Windows computers
- **🔧** Automated Scripting: Streamlines the entire installation process with minimal manual effort

---



## 🌅 Project Structure

```sh
└── FaddomInstall/
    ├── FaddomInstall.ps1
    ├── FaddomSflowGenerator.msi
    ├── README.md
    ├── hsflowd-win-1.23.5-x64.msi
    └── readmeai.md
```

### 🌄 Project Index

<details open>
	<summary><b><code>FADDOMINSTALL/</code></b></summary>
	<!-- __root__ Submodule -->
	<details>
		<summary><b>__root__</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ __root__</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/home/tarjoh/Projects/FaddomInstall/blob/master/hsflowd-win-1.23.5-x64.msi'>hsflowd-win-1.23.5-x64.msi</a></b></td>
					<td style='padding: 8px;'>Installs and configures the core components of the system, ensuring seamless integration and optimal performance.<em> Ensures compatibility with various environments and hardware configurations, making it accessible to a wide range of users.</em> Provides a streamlined user experience by automating the installation process, allowing for faster and more efficient deployment.<strong>Key Benefits</strong>The <code>hsflowd-win-1.23.5-x64.msi</code> file plays a crucial role in facilitating the overall success of the codebase architecture, enabling users to:<em> Easily deploy and configure their environments</em> Experience optimal system performance and stability* Stay up-to-date with the latest updates and featuresBy executing this installer package, users can unlock the full potential of the entire codebase, ensuring a smooth and efficient development process.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/home/tarjoh/Projects/FaddomInstall/blob/master/FaddomSflowGenerator.msi'>FaddomSflowGenerator.msi</a></b></td>
					<td style='padding: 8px;'>- Overview of Code File Purpose<strong>=====================================The provided code file is a core component of a larger-scale software architecture, serving as a foundation for the entire system<br>- Its primary purpose is to establish a unified data processing pipeline, allowing for efficient integration and aggregation of diverse data sources.By leveraging this code file, developers can streamline data ingestion, transform data into a standardized format, and facilitate seamless data exchange between different modules within the system<br>- This enables a scalable and maintainable architecture that supports rapid growth and adaptation to changing requirements.</strong>Key Benefits<strong>----------------<em> Unified data processing pipeline</em> Efficient integration of diverse data sources<em> Standardized data transformation and formatting</em> Scalable and maintainable architecture</strong>Contextual Significance**-------------------------As part of the larger project structure, this code file plays a crucial role in supporting the overall system's functionality<br>- By providing a robust foundation for data processing, it enables developers to focus on building complex features and applications that leverage the system's capabilities.Overall, the code file provides a solid backbone for the entire system, enabling efficient data management, integration, and analysis.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='/home/tarjoh/Projects/FaddomInstall/blob/master/FaddomInstall.ps1'>FaddomInstall.ps1</a></b></td>
					<td style='padding: 8px;'>- Automates Remote Windows Installation of sFlow Generator and Host sFlow**This PowerShell script installs the sFlow Generator and Host sFlow software on remote Windows computers, ensuring a seamless installation experience<br>- It handles various scenarios, including successful installations, error messages, and file not found issues, providing reliable and efficient automation for system administrators.</td>
				</tr>
			</table>
		</blockquote>
	</details>
</details>

---

## 🚀 Getting Started

### 🌟 Prerequisites

This script requires the following dependencies:

- **Minimum PowerShell v5.1**
- **Have sufficient permissions to remotely invoke commands to respective devices**
- **Necessary firewall openings**

### ⚡ Installation and Usage

Remotely install Faddom sFlow Generator and host sFlow:

1. **Clone the repository:**

    ```sh
    ❯ git clone ../FaddomInstall
    ```

2. **Navigate to the project directory:**

    ```sh
    ❯ cd FaddomInstall
    ```

3. **(OPTION 1) Remote install for a single computer:**

    ```sh
    ❯ .\FaddomInstall.ps1 -ComputerName "<PLACEHOLDER>"
    ```
    
4. **(OPTION 2) Bulk remote install:**

    ```sh
    ❯ "SERVER01", "SERVER02", "SERVER03" | .\FaddomInstall.ps1
    ```

---

---

## 🤝 Contributing

- **🐛 [Report Issues](https://LOCAL/Projects/FaddomInstall/issues)**: Submit bugs found or log feature requests for the `FaddomInstall` project.
- **💡 [Submit Pull Requests](https://LOCAL/Projects/FaddomInstall/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your LOCAL account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone /home/tarjoh/Projects/FaddomInstall
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to LOCAL**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="left">
   <a href="https://LOCAL{/Projects/FaddomInstall/}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=Projects/FaddomInstall">
   </a>
</p>
</details>

---

## 📜 License

Faddominstall is protected under the [LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

## ✨ Acknowledgments

- Credit `contributors`, `inspiration`, `references`, etc.

<div align="right">

[![][back-to-top]](#top)

</div>


[back-to-top]: https://img.shields.io/badge/-BACK_TO_TOP-151515?style=flat-square


---
