class Losh < Formula
  desc "Run a local coding agent against remote machines over SSH"
  homepage "https://github.com/akrentsel/losh"
  url "https://github.com/akrentsel/losh/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "aab0341427090177b92908c76df745e3e4d9bd33c52d1a9a9c1960cb3089b83c"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/losh"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/losh version").strip
  end
end
