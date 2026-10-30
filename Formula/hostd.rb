class Hostd < Formula
  desc "Hosting daemon for the Sia network"
  homepage "https://github.com/SiaFoundation/hostd"
  url "https://github.com/SiaFoundation/hostd.git",
      tag:      "v2.12.1",
      revision: "4fb7b948887282929a9f4f04d3542e440e42d72f"

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
