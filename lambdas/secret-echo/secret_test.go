package main_test

import (
	"testing"

	"."
)

func TestGenerator(t *testing.T) {
	pass := main.Generator()
	assert.Equal(t, "password", pass)
}
