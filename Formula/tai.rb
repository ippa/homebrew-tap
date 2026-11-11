class Tai < Formula
  desc "Cross-platform terminal AI assistant with guarded command execution"
  homepage "https://tai.ippa.se"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v1.0.0/tai_1.0.0_darwin_arm64.tar.gz"
      sha256 "81c9ab48eaf39514ea70d45caca5747835e3f65b0320ebb85a8959a5843f5086"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v1.0.0/tai_1.0.0_darwin_x64.tar.gz"
      sha256 "3c761d52c06b8e4aff0966a98e4d2e901b19cd1a1ae3be41612e1be39528c22a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v1.0.0/tai_1.0.0_linux_arm64.tar.gz"
      sha256 "c6b7bd9ff5272d52344901d587d75cae712c2510c6f6a6aa79bd02e787736dc2"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v1.0.0/tai_1.0.0_linux_x64.tar.gz"
      sha256 "b9568fad9245d393776f8324fd448c254bd7dbacecf5143a85dc047a7e9c8d17"
    end
  end

  def install
    bin.install "tai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tai --version")
  end
end
