cask "ocel" do
  version "0.0.3"

  on_macos do
    on_arm do
      sha256 "73c8f73543b7f6e8be0a39b4116345804d7adf029cb27628025f5676a664a82a"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.3/ocel_0.0.3_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "53bfd619276586d231af80511139fbf07f0befb1e6d034cea43b17caaa8c5e9f"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.3/ocel_0.0.3_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "501d656ad9e3c6e912194b9d7490b4a4d01bac2d1cf7cbef8ea254bf6e51fae1"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.3/ocel_0.0.3_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "878d8040b42dab40336567e71657970de026bf6b0fa33ff586a0deffc728cdb5"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.3/ocel_0.0.3_linux_amd64.tar.gz"
    end
  end

  name "ocel"
  desc "Deploys apps into your own cloud"
  homepage "https://ocel.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "ocel"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/ocel"]
    end
  end
end
