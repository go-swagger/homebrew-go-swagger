class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.31.0"
  @@filename = nil
  if OS.mac?
    if Hardware::CPU.arm?
      @@filename = "swagger_darwin_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "59d99e3b7c623f181ee866b93e70e3651e200ae0225db511a8142442490daf82"
    else
      @@filename = "swagger_darwin_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "68bada2e087bc82e160a08a8a8182de1a8b4cd2df74c4e5fc9f05253991cd491"
    end
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      @@filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "b954b0b36144f2cbe65ab1477dd90d7739b5361b2b9004f73d855753c12c6594"
    when "x86_64"
      @@filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "94d63ada4aad825d75ead80c8dba048dbd4c4a013376df9f5b848a41899e9b04"
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
