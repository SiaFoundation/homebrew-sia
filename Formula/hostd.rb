class Hostd < Formula
  desc "Hosting daemon for the Sia network"
  homepage "https://github.com/SiaFoundation/hostd"
  url "https://github.com/SiaFoundation/hostd.git", tag: "v2.2.3"

  depends_on "gcc" => :build
  depends_on "go" => :build

  def install
    system "go", "generate", "./..."
    system "go", "build", "-tags='netgo'", "-trimpath", "-o", bin/"hostd",
           "-a", "-ldflags", "-s -w", "./cmd/hostd"
  end

  test do
    system "#{bin}/hostd", "version"
  end
end
