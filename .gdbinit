add-auto-load-safe-path /software/valgrind/libexec/valgrind/valgrind-monitor.py
source /software/valgrind/libexec/valgrind/valgrind-monitor.py
set debuginfod enabled off

python
print("loading eigen prettyprinters...")
import sys
sys.path.insert(0, '/software/eigen/debug/gdb')
from printers import register_eigen_printers
register_eigen_printers (None)
end

python
print("loading stdc++ prettyprinters...")
import sys
sys.path.insert(0, '/software/gdb-cpp-stl-pretty-printer')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

# python
# import os
# import sys
# if 'GFT_DIR' not in os.environ:
#    print('WARNING: environmental var GFT_DIR not found')
# else:
#    sys.path.insert(0, os.path.expanduser(os.environ['GFT_DIR']))
#    import gdb_fortran_tools
# end

# Update GDB's Python paths with the `sys.path` values of the local Python installation,
# whether that is brew'ed Python, a virtualenv, or another system python.
python
import os
import subprocess
import sys
# Execute a Python using the user's shell and pull out the sys.path (for site-packages)
paths = subprocess.check_output('python -c "import os; import sys;print(os.linesep.join(sys.path).strip())"',shell=True).decode("utf-8").split()
# Extend GDB's Python's search path
sys.path.extend(paths)
end
