/*
 *	MetaCall Library by Parra Studios
 *	Copyright (C) 2016 - 2019 Vicente Eduardo Ferrer Garcia <vic798@gmail.com>
 *
 *	A library for dynamic loading and linking shared objects at run-time.
 *
 */
#include <cs-loader-test/environment.hpp>

#include <gmock/gmock.h>

#include <metacall/metacall.h>

void environment::SetUp()
{
	const char * cs_scripts[] =
	{
		"hello.cs",
		"IJump.cs",
		"JumpMaster.cs",
		"SuperJump.cs",
		"TinyJump.cs"
	};

	ASSERT_EQ((int) 0, (int) metacall_initialize());

	EXPECT_EQ((int) 0, (int) metacall_load_from_file("cs", cs_scripts, sizeof(cs_scripts) / sizeof(cs_scripts[0]), NULL));
}

void environment::TearDown()
{
	EXPECT_EQ((int) 0, (int) metacall_destroy());
}
