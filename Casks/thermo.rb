cask "thermo" do
  version "1.3.1"
  sha256 "9668506f9014ccc031f1d1eafdf580fde4d62e57f923e8477ebdfca5b3483235"

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

  caveats <<~EOS
    🌡️  Thermo is installed! Open it from Spotlight or Launchpad.

    Created by Simarpreet Singh
      Portfolio: https://simarpreet-019.github.io
      X/Twitter: https://x.com/simarpreet_019

    ⭐ Enjoying it? Star or fork: https://github.com/simarpreetsingh-019/Thermo
  EOS

  uninstall quit: "local.thermo"
  zap trash: "~/Library/Preferences/local.thermo.plist"
end
