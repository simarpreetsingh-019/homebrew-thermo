cask "thermo" do
  version "1.2"
  sha256 "3efb9d68721f65178bd300665a8bdc67d32714542a184ba43787cff2c26a17f1"

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
