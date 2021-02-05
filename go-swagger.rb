class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.26.1"
  @@filename = nil
  if OS.mac?
    @@filename = "swagger_darwin_amd64"
    url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
    sha256 "a5c65e5f3672283bcdd1e31c165c98f5a24aab97b6c28fb3413793955b9b6dbd"
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      @@filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "1227c4a0c8656f0376fd31dfd1602ff952cd5c94487b0eb55f83f09a8b26091d"
    when "x86_64"
      @@filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "ad2ad2ab6c4920d517124a17c898134273d5e315d09dcac800ffce83a0f3288b"
    else
      ohdie "Architecture not supported by this formula"
    end
  end

  option "with-goswagger", "Names the binary goswagger instead of swagger"

  def install
    nm = "swagger"
    if build.with? "goswagger"
      nm = "goswagger"
    end
    system "mv", @@filename, nm
    bin.install nm
  end

  test do
    if build.with? "goswagger"
      system "#{bin}/goswagger", "version"
    else
      system "#{bin}/swagger", "version"
    end
  end
end
