// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
// 
// Code generated by Microsoft (R) AutoRest Code Generator 0.14.0.0
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.

namespace Microsoft.Azure.Management.Compute.Models
{
    using System;
    using System.Linq;
    using System.Collections.Generic;
    using Newtonsoft.Json;
    using Microsoft.Rest;
    using Microsoft.Rest.Serialization;
    using Microsoft.Rest.Azure;

    /// <summary>
    /// Describes a virtual machine scale set operating system disk.
    /// </summary>
    public partial class VirtualMachineScaleSetOSDisk
    {
        /// <summary>
        /// Initializes a new instance of the VirtualMachineScaleSetOSDisk
        /// class.
        /// </summary>
        public VirtualMachineScaleSetOSDisk() { }

        /// <summary>
        /// Initializes a new instance of the VirtualMachineScaleSetOSDisk
        /// class.
        /// </summary>
        public VirtualMachineScaleSetOSDisk(string name, DiskCreateOptionTypes? createOption, CachingTypes? caching = default(CachingTypes?), OperatingSystemTypes? osType = default(OperatingSystemTypes?), VirtualHardDisk image = default(VirtualHardDisk), IList<string> vhdContainers = default(IList<string>))
        {
            Name = name;
            Caching = caching;
            CreateOption = createOption;
            OsType = osType;
            Image = image;
            VhdContainers = vhdContainers;
        }

        /// <summary>
        /// Gets or sets the disk name.
        /// </summary>
        [JsonProperty(PropertyName = "name")]
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the caching type. Possible values for this property
        /// include: 'None', 'ReadOnly', 'ReadWrite'.
        /// </summary>
        [JsonProperty(PropertyName = "caching")]
        public CachingTypes? Caching { get; set; }

        /// <summary>
        /// Gets or sets the create option. Possible values for this property
        /// include: 'fromImage', 'empty', 'attach'.
        /// </summary>
        [JsonProperty(PropertyName = "createOption")]
        public DiskCreateOptionTypes? CreateOption { get; set; }

        /// <summary>
        /// Gets or sets the Operating System type. Possible values for this
        /// property include: 'Windows', 'Linux'.
        /// </summary>
        [JsonProperty(PropertyName = "osType")]
        public OperatingSystemTypes? OsType { get; set; }

        /// <summary>
        /// Gets or sets the Source User Image VirtualHardDisk. This
        /// VirtualHardDisk will be copied before using it to attach to the
        /// Virtual Machine.If SourceImage is provided, the destination
        /// VirtualHardDisk should not exist.
        /// </summary>
        [JsonProperty(PropertyName = "image")]
        public VirtualHardDisk Image { get; set; }

        /// <summary>
        /// Gets or sets the list of virtual hard disk container uris.
        /// </summary>
        [JsonProperty(PropertyName = "vhdContainers")]
        public IList<string> VhdContainers { get; set; }

        /// <summary>
        /// Validate the object. Throws ArgumentException or ArgumentNullException if validation fails.
        /// </summary>
        public virtual void Validate()
        {
            if (Name == null)
            {
                throw new ValidationException(ValidationRules.CannotBeNull, "Name");
            }
            if (CreateOption == null)
            {
                throw new ValidationException(ValidationRules.CannotBeNull, "CreateOption");
            }
        }
    }
}
