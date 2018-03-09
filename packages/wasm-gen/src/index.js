// @flow

import * as encoder from "./encoder";

export function encodeNode(n: Node): Array<Byte> {
  switch (n.type) {
    case "ModuleImport":
      // $FlowIgnore: ModuleImport ensure that the node is well formated
      return encoder.encodeModuleImport(n);

    case "SectionMetadata":
      // $FlowIgnore: SectionMetadata ensure that the node is well formated
      return encoder.encodeSectionMetadata(n);

    case "CallInstruction":
      // $FlowIgnore: SectionMetadata ensure that the node is well formated
      return encoder.encodeCallInstruction(n);

    case "CallIndirectInstruction":
      // $FlowIgnore: SectionMetadata ensure that the node is well formated
      return encoder.encodeCallIndirectInstruction(n);

    case "TypeInstruction":
      return encoder.encodeTypeInstruction(n);

    case "ModuleExport":
      // $FlowIgnore: SectionMetadata ensure that the node is well formated
      return encoder.encodeModuleExport(n);

    default:
      throw new Error(
        "Unsupported encoding for node of type: " + JSON.stringify(n.type)
      );
  }
}

export const encodeU32 = encoder.encodeU32;