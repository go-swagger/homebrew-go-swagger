class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.28.0"
  @@filename = nil
  if OS.mac?
    @@filename = "swagger_darwin_amd64"
    url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
    sha256 "d7aab2e66842bca718b8021aa0dea7ab4de2bcdf2224cbab2ff82a5b569f68b4"
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      @@filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "52d3a0b50d1f9b62f11d17b019a04dc8588ce1e41e342a2217294feebeb8b6de"
    when "x86_64"
      @@filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "c9f1888afecb5cb6ddc041db5278f5102be7021f4475f43ec95bfd1289262044"
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
