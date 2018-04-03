package passgenerator

import (
	"testing"
  "github.com/stretchr/testify/assert"
)

func TestGenerator(t *testing.T) {
  tests := []struct {
          long            bool
          expected_char   int
  }{
    {
      long: false,
      expected_char: 8,
    },
    {
      long: true,
      expected_char: 14,
    },
  }

  for _, test := range tests {
      password := Generate(test.long)
      t.Log(password)
      assert.Equal(t, test.expected_char, len(password), "The generated password has mismatch number of expected char")
  }
}
