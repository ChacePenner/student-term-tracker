using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Internals;
using Microsoft.Maui.Controls.Xaml;

namespace D424CapstoneUnitTest
{
    public class DummyFontNamedSizeService : IFontNamedSizeService
        //Because .net maui uses IFontNamedSizeService but the testing environment cannot, this class is
        //necessary to allow inserting username and password values into their respective entries
    {
        public double GetNamedSize(NamedSize size, Type targetElementType)
        {
            // Provide default values for named sizes.
            return size switch
            {
                NamedSize.Micro => 10,
                NamedSize.Small => 12,
                NamedSize.Medium => 14,
                NamedSize.Large => 18,
                NamedSize.Default => 14,
                _ => 14,
            };
        }

       
        public double GetNamedSize(NamedSize size, Type targetElementType, bool useOldSizes)
        {
            
            return GetNamedSize(size, targetElementType);
        }
    }
}
