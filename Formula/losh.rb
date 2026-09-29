class Losh < Formula
  desc "Run a local coding agent against remote machines over SSH"
  homepage "https://github.com/akrentsel/losh"
  url "https://github.com/akrentsel/losh/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "ace542b8e631177ffd3958780b2e9c7aac1c95c81aeb2aef9a7621256ba9d328"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/losh"

    servers = {
      "linux-amd64"  => ["linux", "amd64"],
      "linux-arm64"  => ["linux", "arm64"],
      "darwin-amd64" => ["darwin", "amd64"],
      "darwin-arm64" => ["darwin", "arm64"],
    }

    ENV["CGO_ENABLED"] = "0"
    servers.each do |platform, (goos, goarch)|
      output = libexec/"losh/servers"/platform/"losh-server"
      output.dirname.mkpath
      ENV["GOOS"] = goos
      ENV["GOARCH"] = goarch
      system "go", "build", "-trimpath", "-o", output, "./cmd/losh"
    end
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/losh version").strip

    %w[linux-amd64 linux-arm64 darwin-amd64 darwin-arm64].each do |platform|
      assert_path_exists libexec/"losh/servers"/platform/"losh-server"
    end
  end
end
