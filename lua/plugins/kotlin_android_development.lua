return {

	-- {
	-- 	"AlexandrosAlexiou/kotlin.nvim",
	-- 	ft = { "kotlin" },
	-- 	dependencies = {
	-- 		-- "mason.nvim",
	-- 		-- "mason-lspconfig.nvim",
	-- 		"stevearc/oil.nvim",
	-- 		"folke/trouble.nvim",
	-- 		-- nvim-dap is NOT a kotlin.nvim dependency. Install and configure it
	-- 		-- separately (signs, keymaps, optionally nvim-dap-ui). kotlin.nvim only
	-- 		-- registers a `kotlin` adapter and the `:KotlinDebug` command on top.
	-- 		-- See the "Debugging Support" section below for details.
	-- 	},
	-- 	config = function()
	-- 		require("kotlin").setup({
	-- 			-- Optional: Specify root markers for multi-module projects
	-- 			-- Default: { "build.gradle", "build.gradle.kts", "pom.xml", "mvnw" }
	-- 			root_markers = {
	-- 				"gradlew",
	-- 				".git",
	-- 				"mvnw",
	-- 				"settings.gradle",
	-- 			},

	-- 			-- Optional: JDK for symbol resolution (analyzing your Kotlin code)
	-- 			-- This is the JDK that your project code will be analyzed against
	-- 			-- (the server itself runs on bin/intellij-server's bundled JBR)
	-- 			-- Required for: Analyzing JDK APIs, standard library symbols, platform types
	-- 			--
	-- 			-- Usually should match your project's target JDK version
	-- 			-- Examples:
	-- 			--   macOS:   "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
	-- 			--   Linux:   "/usr/lib/jvm/java-17-openjdk"
	-- 			--   Windows: "C:\\Program Files\\Java\\jdk-17"
	-- 			--   SDKMAN:  os.getenv("HOME") .. "/.sdkman/candidates/java/17.0.8-tem"
	-- 			jdk_for_symbol_resolution = nil, -- Auto-detect from project

	-- 			-- Optional: Specify additional JVM arguments for the kotlin-lsp server
	-- 			jvm_args = {
	-- 				"-Xmx4g", -- Increase max heap (useful for large projects)
	-- 			},

	-- 			-- Optional: Configure inlay hints (requires kotlin-lsp v261+)
	-- 			-- All settings default to true, set to false to disable specific hints
	-- 			inlay_hints = {
	-- 				enabled = true, -- Enable inlay hints (auto-enable on LSP attach)
	-- 				parameters = true, -- Show parameter names
	-- 				parameters_compiled = true, -- Show compiled parameter names
	-- 				parameters_excluded = false, -- Show excluded parameter names
	-- 				parameters_context = false, -- Show context parameter hints
	-- 				types_property = true, -- Show property types
	-- 				types_variable = true, -- Show local variable types
	-- 				function_return = true, -- Show function return types
	-- 				function_parameter = true, -- Show function parameter types
	-- 				lambda_return = true, -- Show lambda return types
	-- 				lambda_receivers_parameters = true, -- Show lambda receivers/parameters
	-- 				value_ranges = true, -- Show value ranges
	-- 				kotlin_time = true, -- Show kotlin.time warnings
	-- 				call_chains = false, -- Show call-chain intermediate types (default false)
	-- 			},

	-- 			-- Optional: LSP-driven folding (requires kotlin-lsp v262.4739.0+)
	-- 			-- Enabled by default; set folding.enabled = false to opt out.
	-- 			folding = { enabled = true },

	-- 			-- Optional: build-importer preference (requires kotlin-lsp v262.4739.0+)
	-- 			-- Mirrors the VSCode `intellij.buildTool` setting:
	-- 			--   nil = let the server pick (default)
	-- 			--   "gradle" or "maven" = force a specific importer
	-- 			--   ""    = none (single-file / no build system)
	-- 			-- build_tool = "gradle",

	-- 			-- Optional: import several projects from one workspace (kotlin-lsp v263.4702.0+).
	-- 			-- Mirrors the VSCode `intellij.projects` setting. `path` is a build file or
	-- 			-- project directory, absolute or relative to the workspace root.
	-- 			-- projects = {
	-- 			--     { type = "gradle", path = "backend" },
	-- 			--     { type = "maven", path = "tools/pom.xml", java_home = "/path/to/jdk-17",
	-- 			--       env = { MAVEN_OPTS = "-Xmx1g" }, system_properties = { ["skip.tests"] = "true" } },
	-- 			-- },

	-- 			-- Optional: re-import when a build file (build.gradle(.kts), settings.gradle(.kts),
	-- 			-- pom.xml) is saved: "ask" (default), "always" or "never".
	-- 			reload_workspace = { on_build_file_save = "ask" },

	-- 			-- Optional: run/debug code lenses above `main` functions (kotlin-lsp v263.4702.0+)
	-- 			code_lens = {
	-- 				enabled = true,
	-- 				-- The server titles lenses with VS Code codicons ("$(play) Run"); these are
	-- 				-- shown instead (Nerd Font glyphs by default). `icons = false` shows text only.
	-- 				-- icons = { play = "", debug = "" },
	-- 				align = true, -- draw the lens at the line's indent instead of at `main`
	-- 			},

	-- 			-- Optional: launching programs (requires nvim-dap)
	-- 			dap = {
	-- 				console = "integratedTerminal", -- or "internalConsole" (output in the dap REPL)
	-- 				build_before_run = true, -- plain JVM launches: run the server's build command first
	-- 				configurations = true, -- add default entries to dap.configurations.kotlin/java
	-- 			},

	-- 			-- Optional: attach kotlin_lsp to Java buffers of a project whose server is already
	-- 			-- running (the VS Code client does this so unsaved Java edits reach Kotlin analysis
	-- 			-- immediately). The Kotlin server offers no Java features itself, and a Java file
	-- 			-- alone never starts it. Set false if you want Java buffers left to jdtls only.
	-- 			java_files = true,

	-- 			-- Optional: JetBrains data sharing / region, as asked by the VS Code extension on first
	-- 			-- start. Unset = share nothing. data_sharing: "none" | "anonymous" | "full";
	-- 			-- region: "africa" | "americas" | "apac" | "china" | "europe" | "middle_east" | "oceania"
	-- 			-- data_sharing = "none",
	-- 			-- region = "europe",

	-- 			-- Optional: disable the RocksDB write-ahead log of the index (VSCode
	-- 			-- `intellij.disableRocksDBWriteAheadLog`)
	-- 			-- disable_rocksdb_wal = false,

	-- 			-- Optional: file templates for new Kotlin files (requires kotlin-lsp v262.4739.0+)
	-- 			-- When you create a new .kt file the plugin asks the server to interpolate the
	-- 			-- chosen template. Pass a table of name → Velocity template to override the
	-- 			-- defaults (Class, File, Interface, Data Class, Enum, Annotation, Object).
	-- 			-- Set { enabled = false } on the table to disable the prompt entirely.
	-- 			-- file_templates = {
	-- 			--     enabled = true,
	-- 			--     -- Class = "package ${PACKAGE_NAME}\n\nclass ${NAME} {\n\t|\n}",
	-- 			-- },
	-- 		})
	-- 	end,
	-- },

	-- lazy.nvim (recommended: pin to a specific version)
	{
		"rizukirr/droid-nvim",
		ft = { "kotlin", "groovy", "xml" },
		opts = {
			lsp = {
				enabled = true, -- Master toggle for all LSPs
				jre_path = nil, -- Shared JRE path (auto-detected)

				-- Kotlin LSP (kotlin-lsp)
				kotlin = {
					enabled = true,
					jdk_for_symbol_resolution = nil,
					jvm_args = {}, -- ignored by kotlin-lsp (uses bundled launcher)
					root_markers = nil,
					suppress_diagnostics = {}, -- e.g. { "PackageDirectoryMismatch" }
					-- Hide a code only on declarations carrying one of the annotations
					suppress_when_annotated = { FunctionName = { "Composable" } },
					inlay_hints = {
						enabled = true,
						parameters = true,
						parameters_compiled = true,
						parameters_excluded = false,
						types_property = true,
						types_variable = true,
						function_return = true,
						function_parameter = true,
						lambda_return = true,
						lambda_receivers_parameters = true,
						value_ranges = true,
						kotlin_time = true,
						call_chains = false,
					},
				},

				-- Groovy LSP (groovy-language-server)
				groovy = {
					enabled = true,
					root_markers = nil, -- defaults: build.gradle, settings.gradle
				},
			},
			logcat = {
				mode = "horizontal", -- "horizontal" | "vertical" | "float"
				height = 15,
				filters = {
					package = "mine", -- "mine" (auto-detect) or specific package
					log_level = "v", -- v, d, i, w, e, f
				},
			},
			android = {
				android_home ="/home/alguien/Android", -- override ANDROID_HOME env var
				android_avd_home ="/home/alguien/.android/avd", -- override ANDROID_AVD_HOME env var
			},
			-- android-cli backend. "auto" uses the `android` binary if on PATH,
			-- true forces it (warns when missing), false disables it entirely.
			-- When active, droid-nvim routes emulator management, :DroidRun
			-- deploy, screenshots, and KB docs through android-cli. :DroidInstall
			-- stays on gradle (android run cannot install without launching).
			android_cli = "false",
		},
	}
}
