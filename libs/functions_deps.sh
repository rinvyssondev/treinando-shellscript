function _get_distro() {
    cat /etc/os-release | grep ^ID= | cut -d = -f 2
}

function _install_curl() {
    case "`_get_distro`" in 
        ubuntu) sudo apt install curl -y ;;
        fedora) sudo yum install curl -y ;;
    esac
}

function _install_kind() {
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64 && \
        chmod +x ./kind && \
        sudo mv ./kind /usr/local/bin/kind
}

function _install_kubectl() {
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
        chmod +x ./kubectl && \
        sudo mv kubectl /usr/local/bin/kubectl

}

function _install_docker() {
    case "`_get_distro`" in
        ubuntu) sudo apt install docker -y;;
        fedora) sudo yum install docker -y && \
        mount  | grep "^cgroup" && \
        sudo mkdir /sys/fs/cgroup/systemd && \
        sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd ;;
    esac
        sudo systemctl enable docker && \
        sudo systemctl start docker.socket && \
        sudo systemctl start docker.service && \
        sudo chmod 666 /var/run/docker.sock && \
    exit
}

function _install_terraform() {
    case "`_get_distro`" in
        ubuntu) curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
            sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
            sudo apt-get update && \
            sudo apt-get install terraform ;;
        fedora) sudo dnf install -y dnf-plugins-core && \
            sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo && \
            sudo dnf -y install terraform ;;
    esac
    exit
}