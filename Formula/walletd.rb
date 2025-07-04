class Walletd < Formula
  desc "Dedicated Sia wallet"
  homepage "https://github.com/SiaFoundation/walletd"
  url "https://github.com/SiaFoundation/walletd.git", tag: "v2.10.4"

  depends_on "gcc" => :build
  depends_on "go" => :build

  def install
    system "go", "generate", "./..."
    system "go", "build", "-tags='netgo'", "-trimpath", "-o", bin/"walletd",
           "-a", "-ldflags", "-s -w", "./cmd/walletd"
  end

  test do
    system "#{bin}/walletd", "version"
  end
end
