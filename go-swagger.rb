class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.30.5"
  @@filename = nil
  if OS.mac?
    if Hardware::CPU.arm?
      @@filename = "swagger_darwin_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "bd03e05b1a1616a93cd520677db8e29aeb5ed676cd6332a5701ba634422a443d"
    else
      @@filename = "swagger_darwin_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "07df005f8ebd92197fee8ba1e0239d1ea444a38f2d9f57a8156117e5b87a7a55"
    end
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      @@filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "bc0e4e209c5fb4b69c4b4a8ce5ee1b5b8b954747efaaa85395158183b41459be"
    when "x86_64"
      @@filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "90cf1b1520bbc5599f98c266edb92c4b46737261b24dd01e8076401237ba64b2"
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
