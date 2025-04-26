package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"luna/cmd/lunamigrate"
	"luna/config"
	"os"
)

var (
	RootCmd = &cobra.Command{
		Use:   "luna",
		Short: "Luna CLI tool",
		Long:  "Luna: a CLI tool for managing migrations and future extensions.",
	}

	configFile     string
	migrationsFlag string
)

func Execute() {
	cobra.OnInitialize(initConfig)

	RootCmd.PersistentFlags().StringVar(&configFile, "config", "", "Config file (default is ./config.yaml)")
	RootCmd.PersistentFlags().StringVar(&migrationsFlag, "migrations", "", "location of migrations directory (default is ./migrations)")

	RootCmd.AddCommand(lunamigrate.Cmd)

	if err := RootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

// initConfig loads the configuration
func initConfig() {
	if configFile != "" {
		viper.SetConfigFile(configFile)
	} else {
		viper.AddConfigPath(".")
		viper.SetConfigName("config")
		viper.SetConfigType("yaml")
	}

	if err := viper.ReadInConfig(); err != nil {
		fmt.Println("Error reading config file:", err)
		os.Exit(1)
	}

	if err := viper.Unmarshal(&config.ConfigValues); err != nil {
		fmt.Println("Unable to decode config into struct:", err)
		os.Exit(1)
	}

	// If --migrations flag is passed, override the config
	if migrationsFlag != "" {
		config.ConfigValues.MigrationsDir = migrationsFlag
	}

	// If still empty, fallback to default
	if config.ConfigValues.MigrationsDir == "" {
		config.ConfigValues.MigrationsDir = "./migrations"
	}
}
