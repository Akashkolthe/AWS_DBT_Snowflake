
import sys
from dbt.cli.main import dbtRunner

def main():
    # Initialize the dbt runner
    dbt = dbtRunner()
    
    # Invoke dbt with command line arguments (excluding the script name)
    # args are passed as a list of strings
    res = dbt.invoke(sys.argv[1:])
    
    # Exit with appropriate status code
    if res.success:
        sys.exit(0)
    else:
        sys.exit(1)

if __name__ == "__main__":
    main()
