using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pr419.classes
{
    static class Instance
    {
        static pr419Entities entities;

        public static pr419Entities getContext()
        {
            if(entities == null) { entities = new pr419Entities(); }
            return entities;
        }
    }
}
