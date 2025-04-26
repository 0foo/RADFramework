package lunamigrate

import (
	"fmt"
	"github.com/spf13/cobra"
	"luna/config"
)

var Cmd = &cobra.Command{
	Use:   "migrate",
	Short: "Run database migrations",
}

func runMigrate(cmdCobra *cobra.Command, args []string) {
	fmt.Println("Running migrations from: ", config.ConfigValues.MigrationsDir)
}

func init() {
	Cmd.AddCommand(UpCmd)
	Cmd.AddCommand(DownCmd)
	Cmd.AddCommand(ForceCmd)
	Cmd.AddCommand(CreateCmd)
}
