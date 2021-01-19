class GoSwagger < Formula
  desc "Toolkit to work with swagger for golang"
  homepage "https://github.com/go-swagger/go-swagger"
  version "0.26.0"
  @@filename = nil
  if OS.mac?
    @@filename = "swagger_darwin_amd64"
    url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
    sha256 "432648b70f3755d471b8c937cb3e1b241f4faf3252f3a0f8837969cb90186f17"
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "aarch64"
      @@filename = "swagger_linux_arm64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "2a86c6b7e9f8a7f57a77cede4e1889da912c08e77b1634045343752b7f0e802d"
    when "x86_64"
      @@filename = "swagger_linux_amd64"
      url "https://github.com/go-swagger/go-swagger/releases/download/v#{version}/#{@@filename}"
      sha256 "3581e78be19d6db5acb3022042032d28b061467a390f3b4eaddd0425909fc2b0"
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
