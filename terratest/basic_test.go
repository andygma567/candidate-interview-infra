package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBasicExample(t *testing.T) {
	t.Parallel()

	// Allow the TerraformBinary option to be changed by users.
	// This makes it possible to switch to tofu easily.
	terraformBinary := os.Getenv("TERRATEST_BINARY")
	if len(terraformBinary) <= 0 {
		terraformBinary = "terraform"
	}

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// Point this at the specific module or example to test.
		TerraformDir: "../examples/basic",

		// Switch between Terraform binaries.
		TerraformBinary: terraformBinary,

		Vars: map[string]interface{}{},
	})

	// Run terraform destroy after all other test code has run, even with errors.
	defer terraform.Destroy(t, terraformOptions)

	// Run terraform apply immediately.
	terraform.InitAndApply(t, terraformOptions)

	// Get outputs and verify they are non-empty.
	dropletIP := terraform.Output(t, terraformOptions, "droplet_ipv4_address")
	volumeID := terraform.Output(t, terraformOptions, "volume_id")

	assert.NotEmpty(t, dropletIP, "Droplet should have a public IPv4 address")
	assert.NotEmpty(t, volumeID, "Block storage volume should have been created")
}
