class Hostd < Formula
  desc "Hostd: A host for Sia"
  homepage "https://github.com/SiaFoundation/hostd"
  url "https://github.com/SiaFoundation/hostd.git", :tag => "v1.0.2-beta.4"

  depends_on "go" => :build
  depends_on "gcc" => :build

  def install
    system "go", "generate", "./..."
    system "go", "build", "-tags='netgo'", "-trimpath", "-o", bin/"hostd", "-a", "-ldflags", "-s -w", "./cmd/hostd"
  end

  test do
    system "#{bin}/hostd", "version"
  end
end

