cask "brosw" do
  version "0.3.0"
  sha256 "e1530948aafc89bcee5e648b6fe5239fddca0d0f7703579a5cf0e52faed3293f"

  url "https://github.com/pictiny/brosw/releases/download/v#{version}/Brosw-#{version}.zip"
  name "Brosw"
  desc "Chrome profile picker that runs as your default browser"
  homepage "https://github.com/pictiny/brosw"

  depends_on macos: :ventura

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
