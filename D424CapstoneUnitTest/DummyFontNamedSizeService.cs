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

        // Implement the second overload to avoid throwing NotImplementedException.
        public double GetNamedSize(NamedSize size, Type targetElementType, bool useOldSizes)
        {
            // Optionally use the useOldSizes parameter if needed, or ignore it.
            return GetNamedSize(size, targetElementType);
        }
    }
}
