.PHONY: helm-docs deps \
	lint lint-md lint-helm \
	lint-fix lint-md-fix

helm-docs:
	helm-docs

deps:
	go install github.com/norwoodj/helm-docs/cmd/helm-docs@v1.5.0
	npm install

lint: lint-md lint-helm
lint-fix: lint-md-fix

lint-md:
	npx remark . .github

lint-md-fix:
	npx remark . .github -o

lint-helm:
	helm lint charts/wharf-helm
