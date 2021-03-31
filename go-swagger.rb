class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.27.0"
  @@filename = nil
  if OS.mac?
    @@filename = "swagger_darwin_amd64"
    url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
    sha256 "90ab5ce33d2ce9d7a48e5710891824569820c18ea962851048b47c44649dfadd"
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      @@filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "132200c2133f30515712f492aed433cec4658b74d7da96c0fda37827030cc4e9"
    when "x86_64"
      @@filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "1ec5a44ae8bb9ffafd02a9c7b1df5a8a43c2296dece02bb8fab6f13f70007f4f"
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
