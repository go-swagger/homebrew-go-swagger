class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.24.0"
  filename = nil
  if OS.mac?
    filename = "swagger_darwin_amd64"
    url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{filename}"
    sha256 "2860ae8cc9fc881bd7b2aeb2ba78da5c7abf7e6e40b5d1bfbf7baa582a70430c"
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{filename}"
      sha256 "226d8038e9949abaa3322330ed8c9b2991fcc0d362c4f4a00a63107acaac0d7c"
    when "x86_64"
      filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{filename}"
      sha256 "50698cc3524e46c805a0a909bb417eaf84cc456dfb162dc2b4e5c6b0d7f6a508"
    else
      ohdie "Architecture not supported by this forumla"
    end
  end

  option "with-goswagger", "Names the binary goswagger instead of swagger"

  def install
    nm = "swagger"
    if build.with? "goswagger"
      nm = "goswagger"
    end
    system "mv", filename, nm
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
