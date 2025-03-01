require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.1.3.tgz"
  sha256 "71b1511524de2a745d30175c9b285b37f41e7cdfaf8f50d4a4ed2194dc51492d"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "fa0901985a74032a54ef6e941d39ef9ff97a01557249279f9b4acad1286f578e"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
