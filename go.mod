module github.com/hashicorp/vault-csi-provider

go 1.13

require (
	github.com/emicklei/go-restful v2.9.5+incompatible // indirect
	github.com/hashicorp/go-hclog v1.0.0
	github.com/hashicorp/golang-lru v0.5.4 // indirect
	github.com/hashicorp/vault/api v1.2.0
	github.com/hashicorp/yamux v0.0.0-20181012175058-2f1d1f20f75d // indirect
	github.com/stretchr/testify v1.8.3
	google.golang.org/grpc v1.56.3
	gopkg.in/yaml.v3 v3.0.1
	k8s.io/api v0.25.0
	k8s.io/apimachinery v0.25.0
	k8s.io/client-go v0.25.0
	sigs.k8s.io/secrets-store-csi-driver v1.3.3
)
