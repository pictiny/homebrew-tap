cask "brosw" do
  version "0.2.0"
  sha256 "3531d34b2e6b5be80f20318eb232a126d08594b3f373aa9b161e32de69b16bfd"

  url "https://github.com/pictiny/brosw/releases/download/v#{version}/Brosw-#{version}.zip"
  name "Brosw"
  desc "Chrome profile picker that runs as your default browser"
  homepage "https://github.com/pictiny/brosw"

  depends_on macos: ">= :ventura"

  app "Brosw.app"

  zap trash: [
    "~/Library/Preferences/io.github.pictiny.Brosw.plist",
  ]

  caveats <<~EOS
    Brosw is ad-hoc signed and not notarized. If macOS refuses to open it,
    remove the quarantine attribute:

      xattr -d com.apple.quarantine "#{appdir}/Brosw.app"

    or install with quarantine disabled:

      brew reinstall --cask --no-quarantine brosw
  EOS
end
