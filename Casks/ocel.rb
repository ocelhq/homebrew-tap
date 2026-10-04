cask "ocel" do
  version "0.0.1"

  on_macos do
    on_arm do
      sha256 "ff9aec2db8064fb82b5937f1515a35623b4e92ff687ba11313796a23505164ee"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.1/ocel_0.0.1_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "53d701a6f5e27e3f61c69c2d50aaa4a6a0fe1f69447aa72fdde2f6192657080d"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.1/ocel_0.0.1_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f3974967562f6ae6afcc1d576843992e82a5d1f9f581bbe619e93d3ab9d17ad3"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.1/ocel_0.0.1_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "52b787b502d26722e055e210bf8f29af6cd0c59d8e01f7a74d79e8ee298c98c9"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.1/ocel_0.0.1_linux_amd64.tar.gz"
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
