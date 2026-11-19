cask "thermo" do
  version "1.7.1"
  sha256 "5c4e34813e077d3e5ae9c01b2e187fe67443091e74c5a5190c8b9b77809aefce"

  url "https://github.com/simarpreetsingh-019/Thermo/releases/download/v#{version}/Thermo.zip"
  name "Thermo"
  desc "Live CPU, RAM, GPU and temperature monitor for the MacBook notch"
  homepage "https://github.com/simarpreetsingh-019/Thermo"

  depends_on macos: ">= :ventura"

  app "Thermo.app"
  binary "#{appdir}/Thermo.app/Contents/Resources/thermo", target: "thermo"

  # Not notarized yet: clear the quarantine flag so it opens without a Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Thermo.app"]
  end

  caveats <<~EOS
    🌡️  Thermo is ready! Open it from Spotlight or Launchpad —
        it lives around your notch (or in the menu bar on other Macs).

    👋 Hey, I'm Simarpreet — I built Thermo. Thanks so much for installing it!
       I'd genuinely love to hear what you think: what works, what's broken,
       and what you'd like it to do next.

       💬 Feedback & ideas:  https://github.com/simarpreetsingh-019/Thermo/issues/new/choose
                            (or ⚙ → "Send Feedback…" inside the app)
       🐦 X / Twitter (DMs open):  https://x.com/simarpreet_019
       🌐 More of my work:  https://simarpreetsingh-019.github.io

    ⭐ If Thermo is useful, a star or a share really helps:
       https://github.com/simarpreetsingh-019/Thermo

    🔄 Thermo updates itself — new versions show up right in the app.
  EOS

  uninstall quit: "local.thermo"
  zap trash: "~/Library/Preferences/local.thermo.plist"
end
