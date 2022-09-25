class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.30.3"
  @@filename = nil
  if OS.mac?
    if Hardware::CPU.arm?
      @@filename = "swagger_darwin_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "cbe81b8f20ed295875d9b385cc8d2a45640aaaf413fd8265ac0c4958cc78e45a"
    else
      @@filename = "swagger_darwin_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "8a8d3a33b0f3f6d41d5134c8651c278159dc3a4d97ef716f361413f351574685"
    end
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      @@filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "670a81668e1c84f0db678a64f8b940bfe288640a3dbbf105a37db75d1ddf1f48"
    when "x86_64"
      @@filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "73dc1bad84c26ad5e44d85ccff89a26efccf422ef7f291f01ae6dc11b3b22d31"
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
