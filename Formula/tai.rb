class Tai < Formula
  desc "Cross-platform terminal AI assistant with guarded command execution"
  homepage "https://tai.ippa.se"
  version "2.2.2"

  on_macos do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.2/tai_2.2.2_darwin_arm64.tar.gz"
      sha256 "4ac6e04836efe4b70c83d95cf9734456b5380ed4c79dd1b69b4c85821535ae04"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.2/tai_2.2.2_darwin_x64.tar.gz"
      sha256 "2f4a6c9cba65f81c9422f8cef5bed2d4a6df0cfbb33eebd77ece3cb83f0d97e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.2/tai_2.2.2_linux_arm64.tar.gz"
      sha256 "4e5e0d0b0233af32403c193b79ca7da83fb26c8fd1a636b8b496cb234e77fa02"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.2/tai_2.2.2_linux_x64.tar.gz"
      sha256 "02f669675259dff89d1b3f513c9227498f80e07b6c4d278c16536c25ec10d429"
    end
  end

  def install
    bin.install "tai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tai --version")
  end
end
