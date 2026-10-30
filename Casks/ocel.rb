cask "ocel" do
  version "0.0.5"

  on_macos do
    on_arm do
      sha256 "351dce385227bd61a266f0c57358b110c6b8b52ff5c9ed3baa4e68ac1b0f15c8"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.5/ocel_0.0.5_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "6c1dccff2e9c73c423d34b90f7fdedf13743405142f245c6c2ccf5b19f759b22"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.5/ocel_0.0.5_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "2859aaa2ad9c0a59c30dc4fdf081c5276a13dce4f4d6e7e2a91d4fb48306cd65"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.5/ocel_0.0.5_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "c71dd589b3780c1c43fff13e7143100757639beb5762fbc201752bd443587ce7"
      url "https://github.com/ocelhq/ocel/releases/download/v0.0.5/ocel_0.0.5_linux_amd64.tar.gz"
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
