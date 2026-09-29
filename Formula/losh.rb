class Losh < Formula
  desc "Run a local coding agent against remote machines over SSH"
  homepage "https://github.com/akrentsel/losh"
  url "https://github.com/akrentsel/losh/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a2cc159fccee7bf0be0316ea87210a390fac3d1dfec4708086dd60bf848afe6c"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/losh"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/losh version").strip
  end
end
