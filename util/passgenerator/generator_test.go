package passgenerator

import (
	"testing"
  "github.com/stretchr/testify/assert"
)

func TestGenerator(t *testing.T) {
	password := Generator()

  assert.Equal(t, "Hi", password, "Seems they are not matched!")
}
