cask "brosw" do
  version "0.2.1"
  sha256 "c045b08d1dc6d02160ecaa6dcff9373986807f58fef1022e09a0369bbf735a11"

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
