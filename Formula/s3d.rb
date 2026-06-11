class S3d < Formula
  desc "Lightweight, S3-compatible Renter for the Sia network"
  homepage "https://github.com/SiaFoundation/s3d"
  url "https://github.com/SiaFoundation/s3d.git", tag: "v0.1.1"

  depends_on "gcc" => :build
  depends_on "go" => :build

  def install
    system "go", "generate", "./..."
    system "go", "build", "-tags='netgo'", "-trimpath", "-o", bin/"s3d",
           "-a", "-ldflags", "-s -w", "./cmd/s3d"
  end

  test do
    system "#{bin}/s3d", "version"
  end
end
