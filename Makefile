PROJECT_DIR := $(shell pwd)
SOURCE_DIR  := $(PROJECT_DIR)/src
SECRETS_DIR := $(PROJECT_DIR)/secrets

CHANNEL       := $(shell git rev-parse --abbrev-ref HEAD) 
RELEASE_NOTES := $(shell git log -1 --pretty=%B)
BUMP          := rc

MANIFEST_DIR := $(PROJECT_DIR)/platform
MANIFESTS    := $(shell find $(MANIFEST_DIR) -name '*.yaml' -o -name '*.tgz')
BUILD_DIR    := build

# release management
bump: 
	@semver up $(BUMP)

build: $(MANIFESTS)
	@kustomize build $(MANIFEST_DIR) --output $(BUILD_DIR)

lint: build
	@replicated release lint --yaml-dir $(BUILD_DIR)

.PHONY: release
release: build bump
	@replicated release create \
		--app ${REPLICATED_APP} \
		--token ${REPLICATED_API_TOKEN} \
		--version $(shell semver get $(BUMP)) \
		--release-notes "$(RELEASE_NOTES)" \
		--yaml-dir $(BUILD_DIR) \
		--promote $(CHANNEL) \
		--auto -y 

.PHONY: vnedor
vendor:
	@vendir sync

