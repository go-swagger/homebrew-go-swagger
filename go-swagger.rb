class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.25.0"
  @@filename = nil
  if OS.mac?
    @@filename = "swagger_darwin_amd64"
    url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
    sha256 "9a3799b93d486b89b8c3a4ee1ff603cddf5d31cd5b314c52e14adbd39f280dc4"
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      @@filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "945ca37125ca58c6c60cc7e4573d4056dedb7801542c1141f46cabdb1b246428"
    when "x86_64"
      @@filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "065cbce4622f40501966e4821ecea6627d7cbac4435e7c41d24b6d7c1411e540"
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
