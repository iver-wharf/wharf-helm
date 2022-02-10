.PHONY: helm-docs deps \
	lint lint-md lint-helm \
	lint-fix lint-fix-md

helm-docs:
	helm-docs

deps:
	go install github.com/norwoodj/helm-docs/cmd/helm-docs@v1.5.0
	npm install

lint: lint-md lint-helm
lint-fix: lint-fix-md

lint-md:
	npx remark . .github

lint-fix-md:
	npx remark . .github -o

lint-helm:
	helm lint charts/wharf-helm
