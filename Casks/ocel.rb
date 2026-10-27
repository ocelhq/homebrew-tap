cask "ocel" do
  version "0.0.4"

  on_macos do
    on_arm do
      sha256 "05ca2042e3a17677a1e75d3c1a37e4b22321bb00d0e73fb5df63d4df0f11d37f"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.4/ocel_0.0.4_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "852f4f34719883fe5fb5df4c69655570fe541089ed9e64de173881bd285c3b3a"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.4/ocel_0.0.4_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "0813b57080e5ca40a8ec1702f94e4d447f00e208e3bd279947cfbcb120ecf8cd"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.4/ocel_0.0.4_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "77b585476b3b2a4ff638d12e2adfe71bcb4e3ca51c48300d1220c4cea9c590bd"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.4/ocel_0.0.4_linux_amd64.tar.gz"
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
