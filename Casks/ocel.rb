cask "ocel" do
  version "0.0.2"

  on_macos do
    on_arm do
      sha256 "c9b8d9716b31b7263528fd1442d056e429214c4b56135c3ef2169aae1bb2bfbb"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.2/ocel_0.0.2_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "c2a5af4ac828eda0b3e098ab71077a4c7e1794403fbadafaa8086cadd0ec7135"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.2/ocel_0.0.2_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "a4dd634bfb74be4465bec993ee0eff9fb41e5beb7f6ed86ec97b10e3246092ec"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.2/ocel_0.0.2_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "b268e233cf20aeb11fdd31764c953cd86fdbbd081b0de48698495d6d2784d224"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.2/ocel_0.0.2_linux_amd64.tar.gz"
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
