cask "thermo" do
  version "1.3"
  sha256 "5a70eb9929adae6b5a8bc925dce2f8ea9b786caa68e549bc4a5084da86ba0b0b"

  url "https://github.com/simarpreetsingh-019/Thermo/releases/download/v#{version}/Thermo.zip"
  name "Thermo"
  desc "Live CPU, RAM, GPU and temperature monitor for the MacBook notch"
  homepage "https://github.com/simarpreetsingh-019/Thermo"

  depends_on macos: ">= :ventura"

  app "Thermo.app"

  # Not notarized yet: clear the quarantine flag so it opens without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Thermo.app"]
  end

  uninstall quit: "local.thermo"
  zap trash: "~/Library/Preferences/local.thermo.plist"
end
