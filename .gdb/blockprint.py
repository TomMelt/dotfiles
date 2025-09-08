import gdb


class PrintHFieldCommand(gdb.Command):
    """Print nx*ny elements of a given type from a memory address as a 2D grid.
    Usage: print_hfield ADDRESS NX NY TYPE."""

    def __init__(self):
        super(PrintHFieldCommand, self).__init__("print_hfield", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        args = gdb.string_to_argv(arg)
        if len(args) < 4:
            print("Usage: print_hfield ADDRESS NX NY TYPE")
            return

        # address = int(gdb.parse_and_eval(args[0] + ".m_data.m_storage.m_data"))
        address = int(gdb.parse_and_eval(args[0]))
        try:
            nx = int(gdb.parse_and_eval(args[1]))
            ny = int(gdb.parse_and_eval(args[2]))
        except ValueError:
            print("NX and NY must be integers.")
            return

        type_name = args[3]
        try:
            gdb_type = gdb.lookup_type(type_name)
        except gdb.error:
            print(f"Type '{type_name}' not found.")
            return

        nmax = 12
        size = gdb_type.sizeof
        for row in range(ny):
            line = []
            for col in range(nx):
                idx = row * nx + col
                addr = address + idx * size
                value = gdb.Value(addr).cast(gdb_type.pointer()).dereference()
                value = float(value)
                value = f"{value:{nmax}.3f}"
                # print("value = ", value)
                if len(value) > nmax:
                    value = nmax * "*"
                line.append(value)
            print(" ".join(line))


PrintHFieldCommand()


class PrintDGFieldCommand(gdb.Command):
    """Print nx*ny elements of a given type from a memory address as a 2D grid.
    Usage: print_dgfield ADDRESS NX NY NCOMP TYPE ."""

    def __init__(self):
        super(PrintDGFieldCommand, self).__init__("print_dgfield", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        args = gdb.string_to_argv(arg)
        if len(args) < 5:
            print("Usage: print_dgfield ADDRESS NX NY NCOMP TYPE")
            return

        # address = int(gdb.parse_and_eval(args[0] + ".m_data.m_storage.m_data"))
        address = int(gdb.parse_and_eval(args[0]))
        try:
            nx = int(gdb.parse_and_eval(args[1]))
            ny = int(gdb.parse_and_eval(args[2]))
            ncomp = int(gdb.parse_and_eval(args[3]))
        except ValueError:
            print("NX and NY must be integers.")
            return

        type_name = args[4]
        try:
            gdb_type = gdb.lookup_type(type_name)
        except gdb.error:
            print(f"Type '{type_name}' not found.")
            return

        max_vars_per_dim = 8
        nmax = 10
        size = gdb_type.sizeof
        for dgcomp in range(1):
            for row in range(ny):
                if row > max_vars_per_dim:
                    break
                line = []
                for col in range(nx):
                    idx = row * nx + col
                    addr = address + idx * size * ncomp + size * dgcomp
                    value = gdb.Value(addr).cast(gdb_type.pointer()).dereference()
                    value = float(value)
                    value = f"{value:{nmax}.3f}"
                    # print("value = ", value)
                    if len(value) > nmax:
                        value = nmax * "*"
                    line.append(value)
                print(" ".join(line[: min(max_vars_per_dim, len(line))]))
            print()


PrintDGFieldCommand()
